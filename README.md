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
Updated: 2026-03-12T06:44:08.790549+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.658 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.795 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.467 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.815 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.586 |  |
| us-east-1 | 0.143 | 4261 |
| us-east-2 | 0.121 | 1419 |
| us-gov-east-1 | 0.120 | 1565 |
| us-gov-west-1 | 0.204 | 180 |
| us-west-1 | 0.188 | 3214 |
| us-west-2 | 0.208 | 144 |

