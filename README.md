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
Updated: 2026-02-13T11:26:00.120140+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.937 |  |
| ap-east-1 | 0.741 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.673 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.783 |  |
| ca-central-1 | 0.179 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.510 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.440 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.800 |  |
| sa-east-1 | 0.552 |  |
| us-east-1 | 0.118 | 4116 |
| us-east-2 | 0.142 | 1336 |
| us-gov-east-1 | 0.142 | 1456 |
| us-gov-west-1 | 0.259 | 145 |
| us-west-1 | 0.204 | 3053 |
| us-west-2 | 0.259 | 125 |

