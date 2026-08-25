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
Updated: 2026-08-25T16:26:57.644919+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.092 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.695 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.238 | 18 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.508 |  |
| eu-central-2 | 0.545 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.191 |  |
| sa-east-1 | 0.626 |  |
| us-east-1 | 0.185 | 5060 |
| us-east-2 | 0.195 | 1684 |
| us-gov-east-1 | 0.174 | 1885 |
| us-gov-west-1 | 0.182 | 227 |
| us-west-1 | 0.118 | 4053 |
| us-west-2 | 0.180 | 188 |

