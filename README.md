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
Updated: 2026-03-17T14:15:45.401945+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.500 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.948 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.749 |  |
| ap-southeast-2 | 0.660 |  |
| ap-southeast-3 | 0.804 |  |
| ap-southeast-4 | 0.702 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.211 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.578 |  |
| eu-south-1 | 0.537 |  |
| eu-south-2 | 0.565 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.476 |  |
| eu-west-3 | 0.508 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.859 |  |
| mx-central-1 | 0.199 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.182 | 4296 |
| us-east-2 | 0.184 | 1430 |
| us-gov-east-1 | 0.148 | 1583 |
| us-gov-west-1 | 0.153 | 187 |
| us-west-1 | 0.160 | 3246 |
| us-west-2 | 0.155 | 148 |

