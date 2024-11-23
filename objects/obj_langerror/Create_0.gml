text = "Error"
depth = -999

with obj_langerror
{
    if id != other.id
        instance_destroy();
}
alpha = 5;
