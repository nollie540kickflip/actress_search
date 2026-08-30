import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with WidgetsBindingObserver {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticated = false;
  bool _isAuthenticating = false; // 認証ダイアログ表示中かどうかを判定
  bool _requireAuthOnResume = false; // バックグラウンドから戻った際に認証が必要か
  String _authMessage = '認証が必要です';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _authenticate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // 認証ダイアログの表示によるバックグラウンド移行ではない場合のみ、再認証フラグを立てる
      if (!_isAuthenticating) {
        _requireAuthOnResume = true;
      }
    } else if (state == AppLifecycleState.resumed) {
      if (_requireAuthOnResume) {
        _requireAuthOnResume = false;
        if (_isAuthenticated) {
          setState(() {
            _isAuthenticated = false;
            _authMessage = '認証が必要です';
          });
        }
        _authenticate();
      }
    }
  }

  Future<void> _authenticate() async {
    if (_isAuthenticating) return;

    setState(() {
      _isAuthenticating = true;
    });

    bool authenticated = false;
    try {
      final bool canAuthenticateWithBiometrics = await _localAuth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _localAuth.isDeviceSupported();

      if (!canAuthenticate) {
        // デバイスが認証をサポートしていない場合はそのまま通す
        setState(() {
          _isAuthenticated = true;
          _isAuthenticating = false;
        });
        return;
      }

      authenticated = await _localAuth.authenticate(
        localizedReason: 'アプリのロックを解除してください',
        persistAcrossBackgrounding: true,
        biometricOnly: false, // PINも許可
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      if (mounted) {
        setState(() {
          _authMessage = '認証エラーが発生しました: ${e.message}';
          _isAuthenticating = false;
        });
      }
      return;
    }

    if (!mounted) return;

    setState(() {
      _isAuthenticating = false;
      if (authenticated) {
        _isAuthenticated = true;
      } else {
        _authMessage = '認証に失敗しました。再試行してください。';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isAuthenticated) {
      return const HomeScreen();
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 8,
            shadowColor: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      size: 64,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    _authMessage,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  FilledButton.icon(
                    onPressed: _isAuthenticating ? null : _authenticate,
                    icon: const Icon(Icons.security),
                    label: const Text('認証してロック解除'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
