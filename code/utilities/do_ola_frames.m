% Last edit 5 June 2019, by Neeraj Sharma (CMU)

function xola = do_ola_frames(X,len,wlen,ovlp,hop)

    % ----- ola the frames
    overlap = ovlp;
    offset = hop;

    xola = zeros(1,offset*size(X,2)+overlap);

    xola(1:wlen) = X(:,1);
    
    nframes = size(X,2);
    
    for k = 2:nframes
        xola(offset+1:offset+wlen) = xola(offset+1:offset+wlen)+X(:,k)';
        offset = k*hop;
    end

    % remove padded first and last wlen zeros and first p samples
    xola = xola(ovlp+1+wlen:end-wlen);
    xola = xola(1:len);
end
