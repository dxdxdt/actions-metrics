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
Updated: 2026-09-04T05:17:42.188620+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.879 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.930 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.450 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.431 |  |
| eu-west-1 | 0.312 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.548 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.498 |  |
| us-east-1 | 0.061 | 5083 |
| us-east-2 | 0.080 | 1685 |
| us-gov-east-1 | 0.086 | 1894 |
| us-gov-west-1 | 0.302 | 231 |
| us-west-1 | 0.240 | 4078 |
| us-west-2 | 0.302 | 191 |

