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
Updated: 2026-07-31T08:44:31.470309+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.743 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.888 |  |
| ap-south-2 | 0.968 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.143 | 17 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.501 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.422 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.202 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.105 | 4924 |
| us-east-2 | 0.117 | 1672 |
| us-gov-east-1 | 0.105 | 1790 |
| us-gov-west-1 | 0.244 | 208 |
| us-west-1 | 0.186 | 3858 |
| us-west-2 | 0.244 | 172 |

