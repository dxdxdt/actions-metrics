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
Updated: 2026-07-26T22:52:59.128170+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.921 |  |
| ap-east-1 | 0.772 |  |
| ap-east-2 | 0.725 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.846 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.788 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.950 |  |
| ca-central-1 | 0.119 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.599 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.094 | 4914 |
| us-east-2 | 0.086 | 1666 |
| us-gov-east-1 | 0.086 | 1780 |
| us-gov-west-1 | 0.267 | 207 |
| us-west-1 | 0.212 | 3840 |
| us-west-2 | 0.266 | 170 |

