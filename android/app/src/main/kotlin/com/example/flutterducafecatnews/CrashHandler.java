package com.example.flutterducafecatnews;

import java.lang.Thread.UncaughtExceptionHandler;
import io.sentry.core.Sentry;

public class CrashHandler implements UncaughtExceptionHandler {

    @Override
    public void uncaughtException(Thread t, Throwable e) {
        Sentry.captureException(e);
    }
}
