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
Updated: 2026-08-13T16:47:22.948445+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.595 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.906 |  |
| ap-southeast-4 | 0.800 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.800 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.136 | 18 |
| ca-west-1 | 0.272 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.444 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.084 | 4986 |
| us-east-2 | 0.110 | 1679 |
| us-gov-east-1 | 0.112 | 1825 |
| us-gov-west-1 | 0.286 | 222 |
| us-west-1 | 0.230 | 3939 |
| us-west-2 | 0.291 | 176 |

