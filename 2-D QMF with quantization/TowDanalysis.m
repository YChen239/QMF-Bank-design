function [v0,v1,v2,v3]=TowDanalysis(h0,h1,X)

[vl,vr]=analysis(h0,h1,X,'row');
[v0,v1]=analysis(h0',h1',vl,'column');
[v2,v3]=analysis(h0',h1',vr,'column');
end