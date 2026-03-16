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
Updated: 2026-03-16T19:50:05.927262+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.976 |  |
| ap-east-1 | 0.702 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.547 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.892 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.684 |  |
| ap-southeast-3 | 0.841 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.203 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.563 |  |
| eu-south-1 | 0.531 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.668 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.829 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.604 |  |
| us-east-1 | 0.155 | 4291 |
| us-east-2 | 0.160 | 1429 |
| us-gov-east-1 | 0.159 | 1578 |
| us-gov-west-1 | 0.198 | 186 |
| us-west-1 | 0.164 | 3243 |
| us-west-2 | 0.203 | 148 |

