classdef PriorityQueue
    % PRIORITYQUEUE A Priority Queue used for A*
    % A simple queue that sorts the priority ascending or descending
    
    properties
        queue = {};
    end
    
    methods
        function obj = insert(obj, node, insertBefore)
            if isempty(obj.queue) == 1
               obj.queue{1,1} = node; 
               return
            end
            
            success = 0;
            for i = 1:length(obj.queue)
                if node(1,5) == obj.queue{1, i}(1,5)
                    if insertBefore == 1
                        obj.queue = [obj.queue(:,1:i-1) node obj.queue(:,i:end)];
                    else
                        obj.queue = [obj.queue(:,1:i) node obj.queue(:,i+1:end)];
                    end
                    success = 1;
                    break;
                elseif node(1,5) < obj.queue{1, i}(1,5)
                    obj.queue = [obj.queue(:,1:i-1) node obj.queue(:,i:end)];
                    success = 1;
                    break;
                end
            end

            if success == 0
                obj.queue{end+1} = node;
            end
        end
    end
    
end

