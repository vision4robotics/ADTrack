function map = create_map(I,target_sz)
w=size(I,2);
h=size(I,1);
center_region=I(round(0.45*h):round(0.55*h),round(0.45*w):round(0.55*w));
target_region=zeros(size(I));
target_region(round((h-target_sz(1))/2):round((h+target_sz(1))/2),round((w-target_sz(2))/2):round((w+target_sz(2))/2))=1;
me=mean(center_region(:));
sig=std(center_region(:),0);
map=zeros(size(I));
map(I>(me-sig)&I<(me+sig))=1;
map=map.*target_region;
end