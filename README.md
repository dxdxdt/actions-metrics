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
Updated: 2026-03-30T20:37:54.002737+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.808 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.215 | 16 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.521 |  |
| eu-central-2 | 0.520 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.521 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.831 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.162 | 4402 |
| us-east-2 | 0.162 | 1467 |
| us-gov-east-1 | 0.168 | 1615 |
| us-gov-west-1 | 0.211 | 190 |
| us-west-1 | 0.154 | 3322 |
| us-west-2 | 0.205 | 152 |

