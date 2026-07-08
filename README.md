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
Updated: 2026-07-08T17:22:00.426684+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.984 |  |
| ap-east-1 | 0.716 |  |
| ap-east-2 | 0.657 |  |
| ap-northeast-1 | 0.537 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.933 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.723 |  |
| ap-southeast-7 | 0.900 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.545 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.430 |  |
| eu-west-2 | 0.463 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.645 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.157 | 4834 |
| us-east-2 | 0.161 | 1656 |
| us-gov-east-1 | 0.145 | 1731 |
| us-gov-west-1 | 0.210 | 201 |
| us-west-1 | 0.159 | 3758 |
| us-west-2 | 0.205 | 164 |

