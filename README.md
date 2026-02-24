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
Updated: 2026-02-24T22:26:12.170069+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.496 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.898 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.644 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.680 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.208 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.574 |  |
| eu-south-2 | 0.583 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.736 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.879 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.654 |  |
| us-east-1 | 0.183 | 4179 |
| us-east-2 | 0.165 | 1377 |
| us-gov-east-1 | 0.175 | 1504 |
| us-gov-west-1 | 0.150 | 161 |
| us-west-1 | 0.115 | 3115 |
| us-west-2 | 0.148 | 130 |

