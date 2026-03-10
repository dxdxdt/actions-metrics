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
Updated: 2026-03-10T18:38:08.021208+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.634 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.615 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.967 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.823 |  |
| ap-southeast-4 | 0.714 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.871 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.559 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.455 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.174 | 4253 |
| us-east-2 | 0.150 | 1417 |
| us-gov-east-1 | 0.153 | 1555 |
| us-gov-west-1 | 0.180 | 177 |
| us-west-1 | 0.155 | 3207 |
| us-west-2 | 0.181 | 144 |

