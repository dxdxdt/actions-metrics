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
Updated: 2026-09-30T16:34:57.818703+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.004 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.525 |  |
| ap-south-1 | 0.896 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.637 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.714 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.224 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.556 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.488 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.917 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.644 |  |
| us-east-1 | 0.197 | 5130 |
| us-east-2 | 0.194 | 1687 |
| us-gov-east-1 | 0.175 | 1931 |
| us-gov-west-1 | 0.166 | 236 |
| us-west-1 | 0.105 | 4148 |
| us-west-2 | 0.164 | 192 |

