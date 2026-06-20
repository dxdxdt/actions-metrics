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
Updated: 2026-06-20T13:43:52.604520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.887 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.947 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.485 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.423 |  |
| il-central-1 | 0.604 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.116 | 4775 |
| us-east-2 | 0.144 | 1636 |
| us-gov-east-1 | 0.137 | 1715 |
| us-gov-west-1 | 0.251 | 198 |
| us-west-1 | 0.198 | 3685 |
| us-west-2 | 0.252 | 163 |

