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
Updated: 2026-08-31T00:05:09.000292+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.000 |  |
| ap-east-1 | 0.664 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.512 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.795 |  |
| ap-southeast-4 | 0.686 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.263 | 18 |
| ca-west-1 | 0.222 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.537 |  |
| eu-north-1 | 0.569 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.550 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.475 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.678 |  |
| me-central-1 | 0.902 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.182 | 5074 |
| us-east-2 | 0.194 | 1685 |
| us-gov-east-1 | 0.194 | 1891 |
| us-gov-west-1 | 0.171 | 228 |
| us-west-1 | 0.111 | 4071 |
| us-west-2 | 0.174 | 189 |

