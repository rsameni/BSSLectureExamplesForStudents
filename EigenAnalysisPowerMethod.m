function v = EigenAnalysisPowerMethod(A, v0, Itr)

v = v0(:);
for k = 1 : Itr
    v = A * v;
    v = v / sqrt(v' * v);
end

