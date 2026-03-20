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
Updated: 2026-03-20T10:31:10.761078+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.894 |  |
| ap-south-2 | 0.949 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.892 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.787 |  |
| ap-southeast-7 | 0.940 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.455 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.463 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.361 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.416 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.763 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.536 |  |
| us-east-1 | 0.103 | 4313 |
| us-east-2 | 0.101 | 1439 |
| us-gov-east-1 | 0.113 | 1590 |
| us-gov-west-1 | 0.268 | 189 |
| us-west-1 | 0.222 | 3266 |
| us-west-2 | 0.260 | 148 |

