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
Updated: 2026-03-31T12:59:19.289931+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.730 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.750 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.220 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.131 | 4406 |
| us-east-2 | 0.109 | 1469 |
| us-gov-east-1 | 0.112 | 1617 |
| us-gov-west-1 | 0.229 | 190 |
| us-west-1 | 0.170 | 3325 |
| us-west-2 | 0.222 | 152 |

