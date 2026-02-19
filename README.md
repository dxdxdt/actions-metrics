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
Updated: 2026-02-19T01:24:16.017364+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.604 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.952 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.807 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.744 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.515 |  |
| eu-central-2 | 0.536 |  |
| eu-north-1 | 0.580 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.447 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.918 |  |
| me-south-1 | 0.877 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.180 | 4140 |
| us-east-2 | 0.184 | 1354 |
| us-gov-east-1 | 0.165 | 1491 |
| us-gov-west-1 | 0.168 | 156 |
| us-west-1 | 0.149 | 3077 |
| us-west-2 | 0.170 | 128 |

