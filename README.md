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
Updated: 2026-03-31T06:12:46.595331+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.731 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.823 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.466 |  |
| eu-central-2 | 0.480 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.428 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.638 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.110 | 4404 |
| us-east-2 | 0.088 | 1468 |
| us-gov-east-1 | 0.089 | 1616 |
| us-gov-west-1 | 0.244 | 190 |
| us-west-1 | 0.191 | 3324 |
| us-west-2 | 0.243 | 152 |

