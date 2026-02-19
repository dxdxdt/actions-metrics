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
Updated: 2026-02-19T14:04:47.322639+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.895 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.613 |  |
| ap-northeast-2 | 0.725 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.785 |  |
| ap-southeast-3 | 0.920 |  |
| ap-southeast-4 | 0.849 |  |
| ap-southeast-5 | 0.880 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.963 |  |
| ca-central-1 | 0.129 | 16 |
| ca-west-1 | 0.328 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.429 |  |
| eu-south-2 | 0.442 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.794 |  |
| me-south-1 | 0.760 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.080 | 4144 |
| us-east-2 | 0.108 | 1356 |
| us-gov-east-1 | 0.109 | 1492 |
| us-gov-west-1 | 0.323 | 156 |
| us-west-1 | 0.253 | 3080 |
| us-west-2 | 0.340 | 128 |

