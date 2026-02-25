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
Updated: 2026-02-25T01:25:23.692476+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.986 |  |
| ap-east-1 | 0.717 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.948 |  |
| ap-southeast-1 | 0.806 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.779 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.501 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.468 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.827 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.591 |  |
| us-east-1 | 0.128 | 4179 |
| us-east-2 | 0.103 | 1378 |
| us-gov-east-1 | 0.100 | 1505 |
| us-gov-west-1 | 0.194 | 161 |
| us-west-1 | 0.200 | 3115 |
| us-west-2 | 0.193 | 130 |

