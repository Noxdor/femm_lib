Util = dofile("femm_lib/util.lua")

-- Select the domain in which the problem exists. This can be either:
-- "magnetic"
-- "electrostatic"
-- "heatflow"
-- "currentflow"
-- otherwise an error is thrown.
function module.select_problem_domain(domain_name)
  local domain_name_id = {
    ["magnetic"] = 0,
    ["electrostatic"] = 1,
    ["heatflow"] = 2,
    ["currentflow"] = 3,
  }
  local domain_id = domain_name_id[domain_name]
  if domain_id == nil then
    local err_msg = format("'%s' is not a valid domain name.", domain_name)
    Util.message(err_msg)
  end
end
