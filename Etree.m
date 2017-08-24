% Finding Elimination Tree;

n = 8;
density = 0.35;
A = full(generatesparseSPDmatrix(n, density));
v = 1:n;

sigma = randperm(n); % Topological ordering
A_lo = tril(A(sigma,sigma), -1);
p = v; % Parent of vertices in tree

for i = 1:n
    vertex = v(i);
    w = find(A_lo(vertex,:));
    if(~isempty(w))
        for j = 1:length(w)
            u = w(j);
            while(u ~= p(u))
                u = p(u);
            end
            p(u) = vertex;
        end
    end
end

p
figure(1)
subplot(121)
etreeplot(A_lo);
subplot(122)
spy(A(sigma,sigma));
%suptitle('Finding the elimination ordering of a sparse matrix');

