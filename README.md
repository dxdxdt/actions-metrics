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
Updated: 2026-07-06T08:12:57.292888+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.807 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.626 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.836 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.937 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.906 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.990 |  |
| ca-central-1 | 0.120 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.443 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.329 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.796 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.510 |  |
| us-east-1 | 0.069 | 4828 |
| us-east-2 | 0.100 | 1653 |
| us-gov-east-1 | 0.096 | 1729 |
| us-gov-west-1 | 0.288 | 201 |
| us-west-1 | 0.241 | 3747 |
| us-west-2 | 0.289 | 164 |

