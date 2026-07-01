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
Updated: 2026-07-01T04:13:18.604285+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.709 |  |
| ap-northeast-3 | 0.634 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.860 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.797 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.458 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.074 | 4806 |
| us-east-2 | 0.086 | 1649 |
| us-gov-east-1 | 0.086 | 1726 |
| us-gov-west-1 | 0.282 | 200 |
| us-west-1 | 0.228 | 3724 |
| us-west-2 | 0.290 | 163 |

