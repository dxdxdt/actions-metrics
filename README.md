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
Updated: 2026-05-09T11:43:24.654586+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.864 |  |
| ap-east-1 | 0.819 |  |
| ap-east-2 | 0.752 |  |
| ap-northeast-1 | 0.635 |  |
| ap-northeast-2 | 0.740 |  |
| ap-northeast-3 | 0.659 |  |
| ap-south-1 | 0.810 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.906 |  |
| ap-southeast-2 | 0.820 |  |
| ap-southeast-3 | 0.954 |  |
| ap-southeast-4 | 0.859 |  |
| ap-southeast-5 | 0.911 |  |
| ap-southeast-6 | 0.861 |  |
| ap-southeast-7 | 0.993 |  |
| ca-central-1 | 0.097 | 16 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.378 |  |
| eu-central-2 | 0.391 |  |
| eu-north-1 | 0.411 |  |
| eu-south-1 | 0.396 |  |
| eu-south-2 | 0.411 |  |
| eu-west-1 | 0.289 |  |
| eu-west-2 | 0.328 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.528 |  |
| me-central-1 | 0.752 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.472 |  |
| us-east-1 | 0.042 | 4617 |
| us-east-2 | 0.090 | 1577 |
| us-gov-east-1 | 0.085 | 1682 |
| us-gov-west-1 | 0.330 | 195 |
| us-west-1 | 0.286 | 3542 |
| us-west-2 | 0.338 | 157 |

