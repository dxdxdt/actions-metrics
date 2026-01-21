# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-01-21T14:22:46.697746+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.693 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.599 |  |
| ap-south-1 | 0.904 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.632 |  |
| ca-central-1 | 0.253 | 16 |
| eu-central-1 | 0.559 |  |
| eu-north-1 | 0.601 |  |
| eu-south-1 | 0.573 |  |
| eu-west-1 | 0.480 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.528 |  |
| me-south-1 | 0.921 |  |
| sa-east-1 | 0.664 |  |
| us-east-1 | 0.206 | 3976 |
| us-east-2 | 0.180 | 1270 |
| us-gov-east-1 | 0.178 | 1385 |
| us-gov-west-1 | 0.151 | 124 |
| us-west-1 | 0.116 | 2896 |
| us-west-2 | 0.149 | 108 |

