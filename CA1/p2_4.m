function [b , a] = p2_4(X , Y)
    syms b;
    syms a;
    fx=@(q,p)((q-b-a*p).*(q-b-a*p));
    counter=1:length(X);
    wantedSigma=sum(fx(Y(1,counter),X(1,counter)));
    equation1=diff(wantedSigma,b);
    equation2=diff(wantedSigma,a);
    eqns=[equation2==0,equation1==0];
    vars = [b a];
    [B, A] = solve(eqns,vars);
    b=eval(B);
    a=eval(A);
end
