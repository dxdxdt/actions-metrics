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
Updated: 2026-06-24T10:15:29.059393+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.637 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.627 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.911 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.667 |  |
| ap-southeast-3 | 0.829 |  |
| ap-southeast-4 | 0.703 |  |
| ap-southeast-5 | 0.790 |  |
| ap-southeast-6 | 0.697 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.160 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.554 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.493 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.624 |  |
| us-east-1 | 0.171 | 4785 |
| us-east-2 | 0.158 | 1638 |
| us-gov-east-1 | 0.147 | 1720 |
| us-gov-west-1 | 0.188 | 199 |
| us-west-1 | 0.131 | 3698 |
| us-west-2 | 0.184 | 163 |

