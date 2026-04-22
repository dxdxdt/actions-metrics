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
Updated: 2026-04-22T06:54:08.584259+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.927 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.702 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.880 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.455 |  |
| eu-north-1 | 0.486 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.824 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.087 | 4539 |
| us-east-2 | 0.085 | 1523 |
| us-gov-east-1 | 0.083 | 1661 |
| us-gov-west-1 | 0.271 | 194 |
| us-west-1 | 0.207 | 3457 |
| us-west-2 | 0.268 | 157 |

