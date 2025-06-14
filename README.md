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
Updated: 2025-06-14T04:16:48.612470+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.826 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.735 |  |
| ap-south-1 | 0.820 |  |
| ap-southeast-1 | 0.868 |  |
| ap-southeast-2 | 0.783 |  |
| ca-central-1 | 0.115 | 10 |
| eu-central-1 | 0.400 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.420 |  |
| eu-west-1 | 0.311 |  |
| eu-west-2 | 0.353 |  |
| eu-west-3 | 0.376 |  |
| me-south-1 | 0.766 |  |
| sa-east-1 | 0.497 |  |
| us-east-1 | 0.065 | 2159 |
| us-east-2 | 0.103 | 518 |
| us-gov-east-1 | 0.108 | 681 |
| us-gov-west-1 | 0.313 | 1 |
| us-west-1 | 0.258 | 1470 |
| us-west-2 | 0.306 |  |

