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
Updated: 2026-05-17T08:59:41.108673+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.614 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.846 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.836 |  |
| ap-southeast-7 | 0.934 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.287 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.467 |  |
| eu-south-1 | 0.447 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.813 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.095 | 4652 |
| us-east-2 | 0.104 | 1597 |
| us-gov-east-1 | 0.110 | 1696 |
| us-gov-west-1 | 0.274 | 195 |
| us-west-1 | 0.215 | 3571 |
| us-west-2 | 0.279 | 158 |

