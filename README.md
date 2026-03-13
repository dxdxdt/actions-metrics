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
Updated: 2026-03-13T21:27:12.147147+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.694 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.925 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.787 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.192 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.541 |  |
| eu-north-1 | 0.568 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.839 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.172 | 4277 |
| us-east-2 | 0.165 | 1422 |
| us-gov-east-1 | 0.133 | 1571 |
| us-gov-west-1 | 0.166 | 183 |
| us-west-1 | 0.176 | 3220 |
| us-west-2 | 0.169 | 146 |

