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
Updated: 2026-02-19T09:37:52.509383+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.780 |  |
| ap-east-2 | 0.709 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.714 |  |
| ap-northeast-3 | 0.615 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.854 |  |
| ap-southeast-2 | 0.747 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.800 |  |
| ap-southeast-5 | 0.873 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.377 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.601 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.786 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.522 |  |
| us-east-1 | 0.092 | 4142 |
| us-east-2 | 0.122 | 1355 |
| us-gov-east-1 | 0.118 | 1492 |
| us-gov-west-1 | 0.287 | 156 |
| us-west-1 | 0.218 | 3079 |
| us-west-2 | 0.274 | 128 |

