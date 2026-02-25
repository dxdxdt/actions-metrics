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
Updated: 2026-02-25T05:56:17.856728+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.751 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.569 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.929 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.733 |  |
| ap-southeast-3 | 0.872 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.494 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.377 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.806 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.095 | 4179 |
| us-east-2 | 0.072 | 1378 |
| us-gov-east-1 | 0.071 | 1507 |
| us-gov-west-1 | 0.220 | 161 |
| us-west-1 | 0.233 | 3115 |
| us-west-2 | 0.223 | 130 |

