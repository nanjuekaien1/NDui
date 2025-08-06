local _, ns = ...
local B, C, L, DB = unpack(ns)
local module = B:GetModule("AurasTable")

local TIER = 11
local INSTANCE = 1302 -- 法力熔炉：欧米伽

local BOSS
BOSS = 2684 -- 集能哨兵
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1218625) -- 错位矩阵
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1219354) -- 潜能法力残渣
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1219459) -- 具现矩阵
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1219531) -- 根除齐射
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1219607) -- 根除齐射
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1219439) -- 湮灭奥能重炮
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1233999) -- 湮灭奥能重炮

BOSS = 2686 -- 卢米萨尔
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1226311) -- 注能束缚
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1226366) -- 活体流丝
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227163) -- 蠕行波
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227784) -- 奥术暴怒
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1237212) -- 贯体束丝
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1237307) -- 巢穴编织
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1243771) -- 奥能黏液
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1247054) -- 超能灌注

BOSS = 2685 -- 缚魂者娜欣达利
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1237607) -- 秘法鞭笞
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1250008) -- 碎裂脉冲
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1226827) -- 碎魂法球
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227051) -- 虚空剑士奇袭
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227276) -- 笞魂歼灭

BOSS = 2687 -- 熔炉编织者阿拉兹
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1228214) -- 星界收割
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1228506) -- 非凡力量
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1232275) -- 奥术抹消
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1233979) -- 星界收割
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1236207) -- 星界涌动

BOSS = 2688 -- 狩魂猎手
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1221490) -- 邪能灼痕
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1222232) -- 吞噬者之怒
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1222307) -- 吞噬
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1222310) -- 无餍之饥
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1223642) -- 锁链咒符
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1225130) -- 邪能之刃
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1226493) -- 破碎之魂
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1241946) -- 脆弱
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1242259) -- 幽魂炸弹
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1242284) -- 灵魂重碾
-- module:RegisterDebuff(TIER, INSTANCE, BOSS, 1245384) -- 邪能地狱

BOSS = 2747 -- 弗兰克提鲁斯
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224414) -- 结晶震荡波
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1231871) -- 震波猛击
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1241137) -- 折射熵变
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227373) -- 碎壳
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1227378) -- 水晶覆体
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1247424) -- 虚无吞噬
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1232760) -- 水晶裂伤
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1250600) -- 虚空闪电

BOSS = 2690 -- 节点之王萨哈达尔
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224737) -- 誓言约束
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224767) -- 侍王之奴
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224795) -- 征服
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224816) -- 主宰
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1224864) -- 处斩（私有）
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1228114) -- 虚空击碎者
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1231097) -- 寰宇裂伤
module:RegisterDebuff(TIER, INSTANCE, BOSS, 1234529) -- 宇宙之喉
BOSS = 2691 -- 诸界吞噬者迪门修斯
