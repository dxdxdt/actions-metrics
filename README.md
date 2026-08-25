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
Updated: 2026-08-25T03:41:46.482408+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.889 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.844 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.904 |  |
| ap-southeast-4 | 0.805 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.791 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.126 | 18 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.408 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.446 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.355 |  |
| eu-west-3 | 0.380 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.517 |  |
| us-east-1 | 0.078 | 5057 |
| us-east-2 | 0.088 | 1684 |
| us-gov-east-1 | 0.101 | 1881 |
| us-gov-west-1 | 0.283 | 227 |
| us-west-1 | 0.231 | 4049 |
| us-west-2 | 0.284 | 186 |

