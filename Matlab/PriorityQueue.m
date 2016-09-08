classdef PriorityQueue
    % PRIORITYQUEUE A Priority Queue used for A*
    % A simple queue that sorts the priority ascending or descending
    
    properties (Access = public)
        queue =  {};
        size = 0;
    end
    
    methods
        %pair: [index number, priority number]
        function obj = insert(obj, pair, insertBefore)
            if isempty(obj.queue) == 1
               obj.queue{1,1} = pair;
               return
            end
            
            success = 0;
            for i = 1:length(obj.queue)
                if pair(1,2) == obj.queue{1, i}(1,2)
                    if insertBefore == 1
                        obj.queue = [obj.queue(:,1:i-1) pair obj.queue(:,i:end)];
                    else
                        obj.queue = [obj.queue(:,1:i) pair obj.queue(:,i+1:end)];
                    end
                    success = 1;
                    break;
                elseif pair(1,2) < obj.queue{1, i}(1,2)
                    obj.queue = [obj.queue(:,1:i-1) pair obj.queue(:,i:end)];
                    success = 1;
                    break;
                end
            end

            if success == 0
                obj.queue{end+1} = pair;
            end
            
            % increase size
            obj.size = obj.size + 1;
        end
        
        function [obj] = pop(obj)
            if isempty(obj.queue) == 1
                return;
            else
               obj.queue = obj.queue(:,2:end);
               obj.size = obj.size - 1;
            end
        end
        
        function [pair, obj] = peek(obj)
            if isempty(obj.queue) == 1
                return;
            else
               pair = obj.queue{1, 1};
            end
        end
    end
    
end

