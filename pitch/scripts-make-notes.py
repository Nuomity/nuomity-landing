# Builds "Speaker notes.html" from the slideshow island in composition/index.html.
import html, json, re
c = open('composition/index.html').read()
island = json.loads(re.search(r'<script type="application/hyperframes-slideshow\+json">(.*?)</script>', c, re.S).group(1))
titles = ['Hook', 'Product demo', 'AI vision', 'Market & model', 'Competition', 'Early traction', 'Team', 'Ask', 'Closing']
rows = []
for i, sl in enumerate(island['slides']):
    n = html.escape(sl.get('notes', '')).replace('[click]', '<b class="clk">▸ click</b>')
    rows.append(f'<section><h2><span>{i + 1:02d}</span> {titles[i]}</h2><p>{n}</p></section>')
page = f'''<!doctype html>
<html lang="en"><head><meta charset="UTF-8" /><title>Nuomity pitch · speaker notes</title>
<style>
  body {{ margin: 40px auto; max-width: 820px; padding: 0 24px; font: 17px/1.55 system-ui, sans-serif; color: #023562; background: #fff; }}
  h1 {{ font-size: 26px; margin: 0 0 6px; }} .meta {{ color: #4a6285; margin-bottom: 28px; }}
  section {{ border-top: 2px solid #dfe7f4; padding: 16px 0 6px; break-inside: avoid; }}
  h2 {{ font-size: 19px; margin: 0 0 6px; }} h2 span {{ color: #1f57bf; font-family: ui-monospace, monospace; margin-right: 6px; }}
  .clk {{ display: inline-block; background: #e4ee5c; color: #023562; border-radius: 10px; padding: 0 7px; font-size: 13px; }}
</style></head><body>
<h1>Nuomity · ROCKIT Progress Days pitch</h1>
<div class="meta">Speaker notes · {len(island["slides"])} slides · ▸ click = press → / Space / clicker</div>
{''.join(rows)}
</body></html>
'''
open('Speaker notes.html', 'w').write(page)
print('notes ok')
