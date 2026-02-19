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
Updated: 2026-02-19T04:13:06.492504+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.646 |  |
| ap-northeast-3 | 0.567 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.852 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.813 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.164 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.480 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.654 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.826 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.133 | 4140 |
| us-east-2 | 0.122 | 1355 |
| us-gov-east-1 | 0.114 | 1491 |
| us-gov-west-1 | 0.198 | 156 |
| us-west-1 | 0.201 | 3077 |
| us-west-2 | 0.196 | 128 |

