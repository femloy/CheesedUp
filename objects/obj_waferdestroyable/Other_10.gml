SS_CODE_START;

with instance_place(x + 1, y, obj_waferdestroyable)
    alarm[0] = 9;
with instance_place(x - 1, y, obj_waferdestroyable)
    alarm[0] = 9;
with instance_place(x, y + 1, obj_waferdestroyable)
    alarm[0] = 9;
with instance_place(x, y - 1, obj_waferdestroyable)
    alarm[0] = 9;

instance_destroy();

SS_CODE_END;
