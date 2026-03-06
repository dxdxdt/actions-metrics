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
Updated: 2026-03-06T09:31:08.302834+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.003 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.648 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.644 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.671 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.218 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.559 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.545 |  |
| eu-west-1 | 0.436 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.495 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.262 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.183 | 4229 |
| us-east-2 | 0.176 | 1402 |
| us-gov-east-1 | 0.179 | 1532 |
| us-gov-west-1 | 0.218 | 173 |
| us-west-1 | 0.142 | 3182 |
| us-west-2 | 0.205 | 141 |

