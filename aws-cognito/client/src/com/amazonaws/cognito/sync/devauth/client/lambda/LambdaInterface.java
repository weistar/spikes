package com.amazonaws.cognito.sync.devauth.client.lambda;

import com.amazonaws.mobileconnectors.lambdainvoker.LambdaFunction;

public interface LambdaInterface {

    @LambdaFunction(functionName = "CognitoAuthTest")
    String readHiddenText();

}