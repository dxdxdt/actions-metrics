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
Updated: 2026-08-03T10:34:20.460686+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.587 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.875 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.714 |  |
| ap-southeast-3 | 0.871 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.918 |  |
| ca-central-1 | 0.190 | 17 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.411 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.611 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.127 | 4936 |
| us-east-2 | 0.150 | 1673 |
| us-gov-east-1 | 0.157 | 1798 |
| us-gov-west-1 | 0.245 | 209 |
| us-west-1 | 0.182 | 3877 |
| us-west-2 | 0.237 | 172 |

