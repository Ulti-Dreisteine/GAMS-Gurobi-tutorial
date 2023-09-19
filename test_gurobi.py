import gurobipy as gp# 创建一个新的模型对象
model = gp.Model('my_model')# 创建变量
x = model.addVar(lb=0, ub=100, vtype=gp.GRB.CONTINUOUS, name='x')
y = model.addVar(lb=0, ub=100, vtype=gp.GRB.CONTINUOUS, name='y')  # 设置目标函数
model.setObjective(x + y, gp.GRB.MINIMIZE)# 添加约束条件
model.addConstr(x + y >= 10, name='c1')# 求解优化问题
model.optimize()# 输出结果
if model.status == gp.GRB.OPTIMAL:
    print('Optimal objective value: {:.2f}'.format(model.objVal))
    print('x = {:.2f}'.format(x.x))
    print('y = {:.2f}'.format(y.x))